local orgmode = require('orgmode')

orgmode.setup_ts_grammar()

orgmode.setup({
  org_agenda_files = { '~/org/*' },
  org_default_notes_file = '~/org/inbox.org',
  org_todo_keywords = {'TODO(t)', 'WAITING(w)', '|', 'DONE(d)', 'CANCELLED(c)'},
  org_capture_templates = {
    t = {
      description = 'Todo',
      template = '* TODO %?\n %u',
      target = '~/org/inbox.org'
    },
    j = {
      description = 'Journal',
      template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
      target = '~/org/journal.org'
    },
  },

})

