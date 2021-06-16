describe 'tabelas', :tabelas do

    before(:each) do
        visit '/tables'
    end

    it 'pega o tony stark na lista' do
        expect(page).to have_content 'Robert Downew Jr'
    end

    it 'salario do stark' do
        atores = all('table tbody tr')
        starrk = atores.detect {|ator| ator.text.include?('Robert Downey Jr')}
        puts stark.text

        expect(stark.text).to include '10.000,00'
    end

    it 'salario do vin diesel' do
        diesel = all('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content '10.000,00'
    end
    
    it 'filme velozes' do
        diesel = all('table tbody tr', text: '@vindiesel')
        movie = diesel.all('td')[2].text
        expect(movie).to eql 'Velozes e Furiosos'
    end

    it 'deve exibir o insta do Chris Evans' do
        evans = find('table tbody tr', text: 'Chris Evans')
        insta = evans.all('td')[4].text
    
        expect(insta).to eql '@teamcevans'
    end
    
      it 'deve selecionar Chris Prat para remoção' do
        prat = find('table tbody tr', text: 'Chris Prat')
        prat.find('a', text: 'delete').click
    
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    
        page.driver.browser.switch_to.alert.accept
    end
    
      it 'deve selecionar Chris Prat para edição' do
        prat = find('table tbody tr', text: 'Chris Prat')
        prat.find('a', text: 'edit').click
    
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    
        page.driver.browser.switch_to.alert.accept
    end

end