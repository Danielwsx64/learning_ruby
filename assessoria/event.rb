class Event
  def initialize(fiancee_name)
    @fiancee_name = fiancee_name
    # @guests = []

    @menu_items = [
      {option: '1', description: 'Editar nome da noiva' },
      # {option: '2', description: 'Cadastrar convidado' },
      # {option: '3', description: 'Listar convidados' },

      {option: 's', description: 'Sair da edição' },
    ]
  end

  def name
    "Casamento da #{self.fiancee_name}"
  end

  def print_name
    puts(self.name)
  end

  def edit
    self.menu()
  end

  private
  
  attr_accessor :fiancee_name

  def menu
    loop do
      
      system('clear')
      puts("Selecione uma opção para editar #{self.name()}: \n\n")

      @menu_items.each do |item| 
        puts("[#{item[:option]}] #{item[:description]}")
      end

      print('Opção: ')
      selected_option = gets.chomp()

      if selected_option == 's'
        break
      else
        self.perform_action_for_option(selected_option)
      end
    end
  end

  def perform_action_for_option(selected_option)
    case selected_option
    when '1'
      self.edit_fiancee_name()
    else
      self.print_feedback('Opção inválida')
    end
  end

  def edit_fiancee_name
    print("Digite o novo nome para a noiva: ")
    self.fiancee_name = gets().chomp()

    self.print_feedback("Nome alterado para #{self.fiancee_name}")
  end

  def print_feedback(msg)
    puts("#{msg}, pressione enter para continuar...")
    gets()
  end
end
