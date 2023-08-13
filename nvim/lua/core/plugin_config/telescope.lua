local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end


local project_actions = require("telescope._extensions.project.actions")

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

telescope.setup {
  extensions = {
    project = {
      base_dirs = {
        "~/proyectosGithub",
      },
      hidden_files = true,
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      sync_with_nvim_tree = true,
      on_project_selected = function(project)
        project_actions.change_working_directory(project, false)
      end,
    },
  },
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-c>"] = actions.close,
      },
    },
  },
}

telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("file_browser")
