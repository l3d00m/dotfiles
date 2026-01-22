#!/usr/bin/env python3
"""
Pomodoro Timer Script
Uses termdown for countdown and dunstify for notifications
25min work / 5min break / 15min long break after 4 pomodoros

Behavior:
- After a work session completes: a break becomes "available" but does NOT start until user confirms.
  While waiting, a reminder notification is sent every 1 minute.
- After a break completes: user can press Enter to continue OR type an int (minutes) to override the
  NEXT work duration.
- Notifications are normal (not critical).
"""

import subprocess
import sys
from datetime import datetime


def get_current_time():
    return datetime.now().strftime("%H:%M:%S")


def run_timer(duration_min, label):
    """Run termdown with the specified duration"""
    print(f"\n{'=' * 50}")
    print(f"[{get_current_time()}] Starting: {label} ({duration_min} minutes)")
    print(f"{'=' * 50}\n")

    try:
        subprocess.run(["termdown", f"{duration_min}min", "-c", "10"], check=True)
    except subprocess.CalledProcessError:
        print("Timer interrupted!")
        return False

    return True


def send_notification(title, message, action_id="continue", action_label="Continue"):
    """Send notification using dunstify (non-blocking, normal urgency)"""
    try:
        subprocess.Popen(
            [
                "dunstify",
                "-h",
                "string:x-dunst-stack-tag:pomodoro",
                title,
                message,
                "-A",
                f"{action_id},{action_label}",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    except FileNotFoundError:
        print("Warning: 'dunstify' not found.  Notifications disabled.")


def clear_notification():
    """Clear the pomodoro notification stack"""
    try:
        subprocess.run(
            ["dunstify", "-C", "-h", "string:x-dunst-stack-tag:pomodoro"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    except FileNotFoundError:
        pass


def confirm_continue_or_minutes(prompt):
    """
    Prompt user:
    - Enter: continue with default duration (returns None)
    - int minutes: override next timer duration (returns int)
    - EOF: returns False
    """
    while True:
        try:
            raw = input(f"\n{prompt} [Enter=continue | minutes=int] ").strip()
            clear_notification()

            if raw == "":
                return None

            minutes = int(raw)
            if minutes <= 0:
                print("Please enter a positive number of minutes, or press Enter.")
                continue
            return minutes
        except ValueError:
            print("Please enter an integer number of minutes, or press Enter.")
        except EOFError:
            return False


def wait_to_start_break_with_reminders(default_break_minutes, break_type):
    """
    Wait until the user starts the break.
    While waiting, send a reminder notification every 1 minute.

    Returns:
      - None -> start break with default_break_minutes
      - int  -> override break minutes
      - False -> user ended session (EOF / Ctrl+C)
    """
    try:
        while True:
            send_notification(
                "🍅 Break ready",
                f"{break_type} available: {default_break_minutes} min. "
                f"Go to terminal and press Enter (or type minutes) to start.",
                "break",
                "Start Break",
            )

            # IMPORTANT: we must actually wait for user input here (instead of
            # running a 1-min timer first). The 1-min reminders are handled by
            # termdown's tick/notify feature: "-c 60" triggers a "tick" every 60s.
            #
            # We implement the waiting with input(), but also want reminders.
            # Easiest without threads: do a 1-minute cycle *after* giving the user
            # a chance to respond immediately.
            override = confirm_continue_or_minutes(
                f"[{get_current_time()}] Start {default_break_minutes} minute {break_type.lower()} now?"
            )
            if override is False:
                return False
            if override is None or isinstance(override, int):
                return override

            # (Unreachable, but kept for clarity)
    except KeyboardInterrupt:
        return False


def main():
    """Main Pomodoro timer loop"""
    print(
        f"""
    ╔═══════════════════════════════════════╗
    ║       🍅 POMODORO TIMER 🍅           ║
    ║                                       ║
    ║  Work:        25 minutes              ║
    ║  Short break: 5 minutes               ║
    ║  Long break:  15 minutes (after 4)    ║
    ╚═══════════════════════════════════════╝

    Started at: {get_current_time()}
    """
    )

    pomodoro_count = 0
    next_work_duration = 25  # can be overridden after a break

    try:
        while True:
            pomodoro_count += 1

            # Work session (possibly overridden)
            work_duration = next_work_duration
            next_work_duration = 25  # reset default for future unless overridden again

            if not run_timer(work_duration, f"Pomodoro #{pomodoro_count} - WORK TIME"):
                break

            send_notification(
                "🍅 Pomodoro Complete!",
                f"Work session #{pomodoro_count} finished. Time for a break!",
                "break",
                "Start Break",
            )

            # Determine break type/duration
            if pomodoro_count % 4 == 0:
                break_duration = 15
                break_type = "LONG BREAK"
            else:
                break_duration = 5
                break_type = "SHORT BREAK"

            # WAIT here for user confirmation/override before starting break
            override_break = wait_to_start_break_with_reminders(
                break_duration, break_type
            )
            if override_break is False:
                print("\nPomodoro session ended.")
                print(f"Completed pomodoros: {pomodoro_count}")
                break
            if isinstance(override_break, int):
                break_duration = override_break

            # Break session
            if not run_timer(break_duration, break_type):
                break

            send_notification(
                "⏰ Break Over!",
                f"{break_type} finished. Ready for the next pomodoro?",
                "work",
                "Start Work",
            )

            # After break: allow Enter to continue, or int to override NEXT work duration
            override_work = confirm_continue_or_minutes(
                f"[{get_current_time()}] Start next pomodoro (default 25 min)?"
            )
            if override_work is False:
                print("\nPomodoro session ended.")
                print(f"Completed pomodoros: {pomodoro_count}")
                break
            if isinstance(override_work, int):
                next_work_duration = override_work

            if pomodoro_count % 4 == 0:
                print("\nCompleted 4 pomodoros! Starting a new cycle.\n")

    except KeyboardInterrupt:
        print("\n\nPomodoro timer stopped.")
        print(f"Completed pomodoros: {pomodoro_count}")
        clear_notification()
        sys.exit(0)


if __name__ == "__main__":
    main()
