describe 'Mouse hover', :houver do
    before(:each) do
        visit '/hovers'
    end

    it 'quando passa o mouse sobre o blade' do
        card = find('img[alt=Blade]')
        # card = find('img[alt*=Blade]') expresão regular
        card.hover

        expect(page).to have_content 'Nome: Blade'
    end

    it 'quando passa o mouse sobre o pantera negra' do
        card = find('img[alt="Pantera Negra"]') # "Pantera Negra" precisa estar dentro de uma string, para o css selector funcionar
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'
    end

    it 'quando passa o mouse sobre o homem aranha' do
        # card = find('img[alt="Homem Aranha"]')
        card = find('img[alt^=Homem]') # utilizando expressão regular
        # card = find('img[alt$=Aranha]') outra expressão regular para css selector
        card.hover

        expect(page).to have_content 'Nome: Homem Aranha'
    end

    after(:each) do
        sleep 3
    end
end