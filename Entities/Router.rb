module Resource
  def connection(routes)
    if routes.nil?
      puts "Нет подходящих маршрутов для #{self}"
      return
    end

    loop do
      print 'Выберите команду для взаимодействия с ресурсами (GET/POST/PUT/DELETE) / q для выхода: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Для выхода выберите действие (index/show) / q: '
        action = gets.chomp
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    puts 'index'
  end

  def show
    puts 'show'
  end

  def create
    puts 'create'
  end

  def update
    puts 'update'
  end

  def destroy
    puts 'destroy'
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Выберите ресурс, с которым хотите взаимодействовать (1 - Сообщения, 2 - Комментарии, q - Выход): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'До свидания!'
  end
  call
  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end