describe 'exemplo com radio button', :radio do 
    before(:each)do
        visit '/radios'
    end

    it 'seleção por ID' do
        choose('cap') #'cap' é o um ID do DOM
    end

    it 'seleção por find e css selector' do
        find('input[value=guardians]').click
        # find = método do capybara para procurar 
        # 'input[value=guardians]' = o que deve ser procurando pelo find
        # click = evento do capybara para clicar no elemento buscando
    end

    after(:each) do
        sleep 3
    end
end