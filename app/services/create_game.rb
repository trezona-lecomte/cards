class CreateGame
  attr_reader :errors, :game

  def initialize
    @errors = [] # @errors = ActiveModel::Errors.new(self)
    @game = Game.new
  end

  def call
    unless @game.valid?
      add_errors(@game.errors)
    end

    @game.save
  end

  private

  def add_errors(errors_to_add)
    errors << errors_to_add
  end
end
