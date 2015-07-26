require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let(:valid_attributes) { { name: Faker::Internet.user_name } }
  let(:invalid_attributes) { { cool_factor: "7.8" } }
  let(:valid_session) { { } }
  let(:game) { Game.create! }

  describe "GET #show" do
    it "assigns the requested player as @player" do
      player = Player.create! valid_attributes
      get :show, {:id => player.to_param}, valid_session
      expect(assigns(:player)).to eq(player)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before { post :create, { game_id: game.to_param, player: valid_attributes}, valid_session }

      it "creates a new Player" do
        expect {
          post :create, { game_id: game.to_param, player: valid_attributes}, valid_session
        }.to change(Player, :count).by(1)
      end

      it "assigns a newly created player as @player" do
        expect(assigns(:player)).to be_a(Player)
        expect(assigns(:player)).to be_persisted
      end

      it "responds with 201 Created" do
        expect(response).to have_http_status(201)
      end
    end

    context "with invalid params" do
      before { post :create, {game_id: game.to_param, player: invalid_attributes}, valid_session }

      # TODO this isn't working, strong params silently strips the invalid parameters
      # it "responds with 400 Bad Request" do
      #   expect(response).to have_http_status(400)
      # end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested player" do
        player = Player.create! valid_attributes
        put :update, {:id => player.to_param, :player => new_attributes}, valid_session
        player.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested player as @player" do
        player = Player.create! valid_attributes
        put :update, {:id => player.to_param, :player => valid_attributes}, valid_session
        expect(assigns(:player)).to eq(player)
      end

      it "redirects to the player" do
        player = Player.create! valid_attributes
        put :update, {:id => player.to_param, :player => valid_attributes}, valid_session
        expect(response).to have_http_status(204)
      end
    end

    context "with invalid params" do
      # TODO not working - strong params
      # it "assigns the player as @player" do
      #   player = Player.create! valid_attributes
      #   put :update, {:id => player.to_param, :player => invalid_attributes}, valid_session
      #   expect(assigns(:player)).to eq(player)
      # end

      # it "re-renders the 'edit' template" do
      #   player = Player.create! valid_attributes
      #   put :update, {:id => player.to_param, :player => invalid_attributes}, valid_session
      #   expect(response).to have_http_status(400)
      # end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested player" do
      player = Player.create! valid_attributes
      expect {
        delete :destroy, {:id => player.to_param}, valid_session
      }.to change(Player, :count).by(-1)
    end

    it "redirects to the players list" do
      player = Player.create! valid_attributes
      delete :destroy, {:id => player.to_param}, valid_session
      expect(response).to have_http_status(204)
    end
  end

end
