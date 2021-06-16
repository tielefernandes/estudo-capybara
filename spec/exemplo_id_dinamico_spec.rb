describe 'IDs Dinâmico', :ids_dinamicos do

    before(:each) do
        visit '/access'
    end

    # $ => começa com
    # ^ => começa com
    # * => contém

    it 'cadastro' do
       find('input[id$=UsernameInput]').set 'tiele'
       find('input[id^=PasswordInput]'). set '123456'
       find('a[id*=GetStartedButton]').click_button

       expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
       sleep 2
    end

end

