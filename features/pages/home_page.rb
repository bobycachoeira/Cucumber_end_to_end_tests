require 'site_prism'


class HomePage < SitePrism::Page
    set_url "/index.php"
    element :sign_in_link_page, '#header > div.nav > div > div > nav > div.header_user_info > a'
    element :search_field, '#search_query_top'
    element :search_button, '[name=submit_search]'
    element :message_error_search, '#center_column > p'
end
