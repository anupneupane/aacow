class Admin::AdminController < ApplicationController
    include AuthenticatedSystem
    layout 'admin/main'
    before_filter :login_required
end