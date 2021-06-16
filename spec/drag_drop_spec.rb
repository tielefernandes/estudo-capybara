describe 'drog and drop' :dragdrop do

    before(:each) do
        visit '/drag_and_drop'
    end

    it 'homem aranha pertence ao time do stark' do
        timeStark = find('.team-stark .column')
        timeCap = find('.team-cap .column')

        spiderman = find('img[atl$=Aranha]')
        spiderman.drag_to timeStark

        expect(timeStark).to have_css 'img[atl$=Aranha]'
        expect(timeCap).not_to have_css 'img[atl$=Aranha]'
    end
end