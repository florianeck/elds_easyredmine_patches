module EldsIssuePatch

  extend ActiveSupport::Concern

  included do
    before_create :set_issue_start_date_from_parent
  end

  private

  def set_issue_start_date_from_parent
    if self.parent.present? && self.start_date.present? && self.parent.start_date.present? && self.start_date < self.parent.start_date
      self.start_date = self.parent.start_date
      self.due_date   = self.start_date+1.day
    end
  end

end