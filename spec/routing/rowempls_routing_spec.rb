require "spec_helper"

describe RowemplsController do
  describe "routing" do

    it "routes to #index" do
      get("/rowempls").should route_to("rowempls#index")
    end

    it "routes to #new" do
      get("/rowempls/new").should route_to("rowempls#new")
    end

    it "routes to #show" do
      get("/rowempls/1").should route_to("rowempls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rowempls/1/edit").should route_to("rowempls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rowempls").should route_to("rowempls#create")
    end

    it "routes to #update" do
      put("/rowempls/1").should route_to("rowempls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rowempls/1").should route_to("rowempls#destroy", :id => "1")
    end

  end
end
