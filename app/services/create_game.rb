class CreateGame
  attr_reader :errors, :game

  def initialize
    @errors = []
    @game = nil
  end

  def call
    @game = Game.create

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
