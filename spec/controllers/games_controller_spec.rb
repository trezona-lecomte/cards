require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:valid_attributes) { { } }
  let(:invalid_attributes) { { fudge: "poopey" } }
  let(:valid_session) { {} }
  let(:game) { Game.create! valid_attributes }

  describe "GET #index" do
    it "assigns all games as @games" do
      game = Game.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:games)).to eq([game])
    end
  end

  describe "GET #show" do
    it "assigns the requested game as @game" do
      game = Game.create! valid_attributes
      get :show, {:id => game.to_param}, valid_session
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Game" do
        expect {
          post :create, {:game => valid_attributes}, valid_session
        }.to change(Game, :count).by(1)
      end

      it "assigns a newly created game as @game" do
        post :create, {:game => valid_attributes}, valid_session
        expect(assigns(:game)).to be_a(Game)
        expect(assigns(:game)).to be_persisted
      end

      it "redirects to the created game" do
        post :create, {:game => valid_attributes}, valid_session
        expect(response.status).to eq(201)
      end
    end

    context "with invalid params" do
      it "ignores the params and creates a game" do
        post :create, {:game => invalid_attributes}, valid_session
        expect(response.status).to eq(201)
      end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested game" do
  #       game = Game.create! valid_attributes
  #       put :update, {:id => game.to_param, :game => new_attributes}, valid_session
  #       game.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested game as @game" do
  #       game = Game.create! valid_attributes
  #       put :update, {:id => game.to_param, :game => valid_attributes}, valid_session
  #       expect(assigns(:game)).to eq(game)
  #     end

  #     it "redirects to the game" do
  #       game = Game.create! valid_attributes
  #       put :update, {:id => game.to_param, :game => valid_attributes}, valid_session
  #       expect(response).to redirect_to(game)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the game as @game" do
  #       game = Game.create! valid_attributes
  #       put :update, {:id => game.to_param, :game => invalid_attributes}, valid_session
  #       expect(assigns(:game)).to eq(game)
  #     end

  #     it "re-renders the 'edit' template" do
  #       game = Game.create! valid_attributes
  #       put :update, {:id => game.to_param, :game => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  describe "DELETE #destroy" do
    it "destroys the requested game" do
      game = Game.create! valid_attributes
      expect {
        delete :destroy, {:id => game.to_param}, valid_session
      }.to change(Game, :count).by(-1)
    end

     it "returns a 204 no content http status code" do
      delete :destroy, {:id => game.to_param}, valid_session
      expect(response.status).to eq(204)
    end
  end

end
