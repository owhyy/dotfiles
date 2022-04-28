local nvim_lsp = require("lspconfig")

nvim_lsp.ocamllsp.setup {
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason" },
    root_dir = nvim_lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "."),
    settings = {
        ocamllsp = {
            autoformat = true,
            completion = true,
            diagnostic = true,
            references = true,
            rename = true,
            symbols = true
        }
    }
}
