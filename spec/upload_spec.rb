describe 'fazendo upload', :upload do
    before(:each) do
        visit '/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/imagem.png'
    end

    it 'upload com arquivo texto' do
        # puts @arquivo - retorna no console o que há dentro do arquivo
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'arquivo.txt'
    end

    it 'upload de imagem', :upload_imagem do 
        attach_file('file-upload', @imagem)
        click_button 'Upload'

        puts Capybara.default_max_wait_time
        # propriedade do capybara para timeout

        # qual a diferença do sleep pro default_max_wait_time?
            # sleep é com o valor fixo, já com default_max_wait_time é ATÉ o valor configurado conforme no spec_helper

        img = find('#new-image')
        expect(img[:src]).to include '/uploads/imagem.png'
    end

    after(:each) do
        sleep 3
    end
end