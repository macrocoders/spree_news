Deface::Override.new(virtual_path: 'spree/admin/shared/_menu',
                     name: 'news_admin_tab',
                     insert_bottom: "[data-hook='admin_tabs']",
                     text: "<%= tab(:news_index) %>",
                     disabled: false)
