vim.g.coq_settings = {
  auto_start = 'shut-up',
  completion = {
    always = true
  },
  limits = {
    completion_auto_timeout = 3
  },
  clients = {
    tmux = {
      all_sessions = false
    }
  },
  display = {
    pum = {
      kind_context = {" | ", ""},
      source_context = {" ", ""}
    },
    icons = {
      mode = 'short',
    },
  }
}

