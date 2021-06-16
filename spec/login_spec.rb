describe 'Forms' do
    it 'login de acesso com sucesso' do
        visit '/login'
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis!'
        click_button 'Login'
        expect(find('#flash').visible?).to be true
        puts find('#flash').text 
        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'login com senha incorreta' do
        visit 'login'
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis'
        click_button 'Login'
        expect(find('#flash')).to have_content 'Senha é invalida!'
    end
end