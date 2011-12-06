require 'spec_helper'

describe MemosController do

  # This should return the minimal set of attributes required to create a valid
  # Memo. As you add validations to Memo, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all memos as @memos" do
      memo = Memo.create! valid_attributes
      get :index
      assigns(:memos).should eq([memo])
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Memo" do
        expect {
          post :create, :memo => valid_attributes
        }.to change(Memo, :count).by(1)
      end

      it "assigns a newly created memo as @memo" do
        post :create, :memo => valid_attributes
        assigns(:memo).should be_a(Memo)
        assigns(:memo).should be_persisted
      end

      it "gets 200 status" do
        post :create, :memo => valid_attributes
        response.status.should == 200
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved memo as @memo" do
        # Trigger the behavior that occurs when invalid params are submitted
        Memo.any_instance.stub(:save).and_return(false)
        post :create, :memo => {}
        assigns(:memo).should be_a_new(Memo)
      end

      it "gets error status in JSON" do
        Memo.any_instance.stub(:save).and_return(false)
        post :create, :memo => {}
        update_response = JSON.parse(response.body)
        update_response['status'].should == 'error'
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested memo" do
        memo = Memo.create! valid_attributes
        Memo.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => memo.id, :memo => {'these' => 'params'}
      end

      it "assigns the requested memo as @memo" do
        memo = Memo.create! valid_attributes
        put :update, :id => memo.id, :memo => valid_attributes
        assigns(:memo).should eq(memo)
      end

      it "gets success status in JSON" do
        memo = Memo.create! valid_attributes
        put :update, :id => memo.id, :memo => valid_attributes
        update_response = JSON.parse(response.body)
        update_response['status'].should == 'success'
      end

      it "gets 200 status" do
        memo = Memo.create! valid_attributes
        put :update, :id => memo.id, :memo => valid_attributes
        response.status.should == 200
      end
    end

    describe "with invalid params" do
      it "assigns the memo as @memo" do
        memo = Memo.create! valid_attributes
        Memo.any_instance.stub(:save).and_return(false)
        put :update, :id => memo.id, :memo => {}
        assigns(:memo).should eq(memo)
      end

      it "gets error status in JSON" do
        memo = Memo.create! valid_attributes
        Memo.any_instance.stub(:save).and_return(false)
        put :update, :id => memo.id, :memo => {}
        update_response = JSON.parse(response.body)
        update_response['status'].should == 'error'
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested memo" do
      memo = Memo.create! valid_attributes
      expect {
        delete :destroy, :id => memo.id
      }.to change(Memo, :count).by(-1)
    end

    it "gets 200 status" do
      memo = Memo.create! valid_attributes
      delete :destroy, :id => memo.id
      response.status.should == 200
    end
  end

end
