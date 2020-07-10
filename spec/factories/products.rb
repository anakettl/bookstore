FactoryBot.define do 
	factory :product do
    name { 'O mito de Sísifo' }
    author { 'Albert Camus' }
    description { 'De um dos mais importantes e representativos autores do século XX e Prêmio Nobel de Literatura.Albert Camus, um dos escritores e intelectuais mais influentes do século XX, publicou O mito de Sísifo em 1942. Este ensaio sobre o absurdo tornou-se uma importante contribuição filosófico-existencial e exerceu profunda influência sobre toda uma geração.' }
    price { 32.44 }
    amount { 5 }
	end
end 