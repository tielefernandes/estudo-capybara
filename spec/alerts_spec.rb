describe 'alertas do JS' do

    before(:each) do
        visit '/javascript_alerts'
    end

    it 'alert' do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text
        puts msg
        expect(msg).to eql 'Isto é uma mensagem de alerta'
        sleep 3
    end

    it 'confirmar mensagem no alert' do
        msg = page.driver.browser.switch_to.alert.text
        expect(msg). to eql 'E aí confirma?'

        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'não confirmar mensagem no alert' do
        msg = page.driver.browser.switch_to.alert.text
        expect(msg). to eql 'E aí confirma?'

        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'exemplo accept no alert - prompt', :accept_prompt do 
        accept_prompt(with: 'Tiele') do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, Tiele'
        sleep 3
    end

    # desafio

    it 'dismiss prompt', :dismiss_prompt do
        dismiss_prompt(with: '') do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, null'
        sleep 3
    end

end