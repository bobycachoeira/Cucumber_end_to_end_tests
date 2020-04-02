require 'site_prism'


class LoginPage < SitePrism::Page
    set_url "/login"
    element :already_registed_area, '#login_form'
    element :email_address_field, '#email'
    element :password_field, '#passwd'
    element :sign_in_button, '#SubmitLogin'
    element :return_message_wrong_login, '#center_column > div.alert.alert-danger > ol'


    ###sessão de step  exemplo de como seria usar uma sessão###
    class SelectAgentModal < SitePrism::Section
        element :cancel_button, 'body > app-root > main > app-login > app-select-agente > app-modal > div > div > div > div.modal-footer > button.btn.btn-border-orange.pull-left'
        element :confirm_button, 'body > app-root > main > app-login > app-select-agente > app-modal > div > div > div > div.modal-footer > button.btn.btn-full-orange.pull-right'

    end
    section :select_agent_modal, SelectAgentModal, 'body > app-root > main > app-login > app-select-agente > app-modal > div > div > div'


    ### Metyodo para fazer login se quiser chamar ele direto funciona###
    def do_login(email, pwd)
        email_address_field.set email
        password_field.set pwd
        sign_in_button.click
    end

end
