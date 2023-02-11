require_relative 'event'

class Assessoria
  attr_reader :events

  def initialize
    @events = []

    @menu_items = [
      {option: '1', description: 'Cadastrar evento' },
      {option: '2', description: 'Editar evento' },
      {option: '3', description: 'Listar eventos' },

      {option: 's', description: 'Sair' },
    ]
  end

  def start
    self.menu()
  end

  private

  def menu
    loop do
      
      system('clear')
      puts("Selecione uma opção: \n\n")

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
      self.add_event()
    when '2'
      self.edit_events()
    when '3'
      self.list_events()
    else
      self.print_feedback('Opção inválida')
    end
  end

  def add_event
    print( "Digite o nome da noiva: " )
    @events << Event.new(gets().chomp())

    self.print_feedback('Evento cadastrado com sucesso')
  end

  def edit_events
    self.events.each_with_index do |event, index| 
      puts("[#{ index + 1 }] #{event.name}")
    end

    print('Escolha o evento: ')
    selected_event_index = gets.chomp().to_i()

    if selected_event_index > @events.length
      self.print_feedback("O número escolhido #{selected_event_index} não está disponivel")
    else
      self.events[selected_event_index - 1].edit()
    end
  end

  def list_events
    self.events.each do |event|
      event.print_name()
    end

    self.print_feedback('Lista impressa')
  end

  def print_feedback(msg)
    puts("#{msg}, pressione enter para continuar...")
    gets()
  end
end

Assessoria.new().start()
