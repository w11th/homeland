# coding: utf-8
module Admin
  class SiteConfigsController < Admin::ApplicationController
    before_action :set_setting, only: [:edit, :update]

    def index
    end

    def edit
    end

    def update
      if @site_config.value != setting_param[:value]
        @site_config.value = setting_param[:value]
        @site_config.save
        @site_config.expire_cache
        ## hotfix: update the cache after alter the node_ids_high_level
        CacheVersion.section_node_updated_at if params[:id] == 'node_ids_high_level'
        redirect_to admin_site_configs_path, notice: '保存成功.'
      else
        redirect_to admin_site_configs_path
      end
    end

    def set_setting
      @site_config = Setting.find_by(var: params[:id]) || Setting.new(var: params[:id])
    end

    private

    def setting_param
      params[:setting].permit!
    end
  end
end
