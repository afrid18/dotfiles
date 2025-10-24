return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  config = function()
    require("codecompanion").setup({
      adapters = {
        -- deepseek
        deepseek = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            schema = {
              model = {
                default = "deepseek/deepseek-chat",
              },
            },
            env = {
              url = "https://openrouter.ai", -- optional: default value is ollama url http://127.0.0.1:11434
              api_key = "",
              -- api_key = "cmd: gpg --batch --quiet --decrypt /Users/imamkhaja/.secrets/openrouter-api.gpg",
              chat_url = "/api/v1/chat/completions"
            },
          })
        end,

        -- gemini
        gemini = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            schema = {
              model = {
                default = "google/gemini-2.5-flash-preview",
              },
            },
            env = {
              url = "https://openrouter.ai", -- optional: default value is ollama url http://127.0.0.1:11434
              api_key = "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",
              -- api_key = "cmd: gpg --batch --quiet --decrypt /Users/imamkhaja/.secrets/openrouter-api.gpg",
              chat_url = "/api/v1/chat/completions"
            },
          })
        end
      },
      strategies = {
        chat = { adapter = "gemini", },
        inline = { adapter = "gemini" },
        agent = { adapter = "gemini" },
      },
    })
  end
}
