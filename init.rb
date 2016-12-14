Redmine::Plugin.register :elds_easyredmine_patches do
  name 'ELDS EasyRedmine Patches'
  author 'Florian Eck / EL digital.solutions'
  description 'Fixes some smaller issues recognized during work with EasyRedmine'
  version '1.0'
end

require 'elds_issue_patch'

Rails.application.config.after_initialize do
  Issue.send(:include, EldsIssuePatch)
end
