local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {

   -- webdev stuff
   b.formatting.autopep8,
   b.formatting.eslint_d,
   b.formatting.isort,
   b.formatting.latexindent,
   b.formatting.prettierd,

   b.hover.dictionary,

   b.code_actions.eslint_d,

   b.diagnostics.ansiblelint,
   b.diagnostics.chktex,
   b.diagnostics.eslint_d,
   b.diagnostics.flake8,
}

null_ls.setup {
   debug = true,
   sources = sources,
}
