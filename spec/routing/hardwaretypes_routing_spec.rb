require "spec_helper"

describe HardwaretypesController do
  describe "routing" do

    it "routes to #index" do
      get("/hardwaretypes").should route_to("hardwaretypes#index")
    end

    it "routes to #new" do
      get("/hardwaretypes/new").should route_to("hardwaretypes#new")
    end

    it "routes to #show" do
      get("/hardwaretypes/1").should route_to("hardwaretypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hardwaretypes/1/edit").should route_to("hardwaretypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hardwaretypes").should route_to("hardwaretypes#create")
    end

    it "routes to #update" do
      put("/hardwaretypes/1").should route_to("hardwaretypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hardwaretypes/1").should route_to("hardwaretypes#destroy", :id => "1")
    end

  end
end
