describe 'select 2', :select2 do
    
    describe('uma opção', :single )do
        before(:each) do
            visit '/apps/select2/single.html'
        end

        it 'seleciona ator por nome' do
            find('.select2-selecion--single').click
            sleep 1
            find('.select2-results__option', text: 'Adam Sandler').click
            sleep 5
        end

        it 'busca e clica no resultado' do
            find('.select2-selecion--single').click
            sleep 1
            find('.select2-search__field').set 'Chris Rock'
            sleep 1
            find('.select2-results__option').click
        end
    end

    describe('multiplias opções', :multiple) do
        before(:each) do
            visit 'apps/select2/multi.html'
        end

        # cria método para encapsular código para repetir ação de selecionar ator
        def selecione(ator)
            find('.select2-selecion--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click
        end

        it 'seleciona atores' do

            atores = ['Jim Carrey', 'Owen Wilson', 'Kevin James']
            # selecione('Jim Carrey')
            # selecione('Owen Wilson')

            atores.each do |a|
                selecione(a)
            end 
            sleep 5
        end
    end

end