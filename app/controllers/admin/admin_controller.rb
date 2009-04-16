class Admin::AdminController < ApplicationController
    include AuthenticatedSystem
    layout 'admin/main'
end