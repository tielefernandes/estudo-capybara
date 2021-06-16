# describe 'suíte' do
#     it '' do
#         select('Opção', from 'elemento')
# end


describe 'dropdown - caixa de opções', :dropdown do

    it 'seleciona item específico simples' do
        visit '/dropdown'
        select('Loki', from: 'dropdown')
        sleep 3
    end

    it 'seleciona item específico com find' do 
        visit 'dropdown'
        listaDeVingadores = find('.avenger-list')
        listaDeVingadores.find('option', text: 'Scott Lang').select_option
        sleep 3
    end

    it 'sorteia um item sorteado', :sample do 
        visit 'dropdown'
        listaDeVingadores = find('.avenger-list')
        listaDeVingadores.all('option').sample.select_option
        sleep 3 
    end

end