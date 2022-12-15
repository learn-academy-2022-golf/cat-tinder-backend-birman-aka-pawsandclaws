require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it 'gets a list of cats' do
      Cat.create(
        name: 'Max',
        age: 7,
        enjoys: 'Sleeps all day',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it 'can create a cat' do
      cat_params = {
        cat: {
          name: 'Kaya',
          age: 4,
          enjoys: 'Sunbathes all day',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      post '/cats', params: cat_params
      expect(response).to have_http_status(200)
      cat = Cat.first
      expect(cat.name).to eq 'Kaya'
    end
    it "doesn't create a cat without a name" do
      cat_params = {
        cat: {
          age: 4,
          enjoys: 'Sunbathes all day',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq(422)
      json = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"

    end
    it "doesn't create a cat without a age" do
      cat_params = {
        cat: {
          name: 'Kaya',
          enjoys: 'Sunbathes all day',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq(422)
      json = JSON.parse(response.body)
      expect(json['age']).to include "can't be blank"

    end
    it "doesn't create a cat without enjoys" do
      cat_params = {
        cat: {
          name: 'Kaya',
          age: 4,
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq(422)
      json = JSON.parse(response.body)
      expect(json['enjoys']).to include "can't be blank"

    end
    it "doesn't create a cat without an image" do
      cat_params = {
        cat: {
          name: 'Kaya',
          age: 4,
          enjoys: 'long walks on the beach'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq(422)
      json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end
  end

  describe 'PATCHES /update' do
    it 'can update a cat with specific ID' do 
      Cat.create(
        name: 'Max',
        age: 7,
        enjoys: 'Sleeps all day',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

        cat_params = {
          cat: {
            name: 'Max',
            age: 8,
            enjoys: 'Sleeps all day and eats all day',
            image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      
      cat = Cat.last
      patch "/cats/#{cat.id}", params: cat_params
      expect(response).to have_http_status(200)
      updated_cat = Cat.find(cat.id)

      expect(updated_cat.age).to eq 8
      expect(updated_cat.enjoys).to eq "Sleeps all day and eats all day"
    end
    it "doesn't update a cat without a name" do
      Cat.create(
        name: 'Max',
        age: 7,
        enjoys: 'Sleeps all day',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )
      cat_params = {
        cat: {
          name: nil,
          age: 4,
          enjoys: 'Sunbathes all day',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      cat = Cat.last
      patch "/cats/#{cat.id}", params: cat_params
      expect(response.status).to eq(422)
      json = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"

    end
    it "doesn't update a cat without an age" do
      Cat.create(
        name: 'Max',
        age: 7,
        enjoys: 'Sleeps all day',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )
      cat_params = {
        cat: {
          name: 'Kaya',
          age: nil,
          enjoys: 'Sunbathes all day',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      cat = Cat.last
      patch "/cats/#{cat.id}", params: cat_params
      expect(response.status).to eq(422)
      json = JSON.parse(response.body)
      expect(json['age']).to include "can't be blank"

    end
    it "doesn't update a cat without enjoys" do
      Cat.create(
        name: 'Max',
        age: 7,
        enjoys: 'Sleeps all day',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )
      cat_params = {
        cat: {
          name: 'Kaya',
          age: 4,
          enjoys: nil,
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      cat = Cat.last
      patch "/cats/#{cat.id}", params: cat_params
      expect(response.status).to eq(422)
      json = JSON.parse(response.body)
      expect(json['enjoys']).to include "can't be blank"

    end
    it "doesn't update a cat without an image" do
      Cat.create(
        name: 'Max',
        age: 7,
        enjoys: 'Sleeps all day',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )
      cat_params = {
        cat: {
          name: 'Kaya',
          age: 4,
          enjoys: 'long walks on the beach',
          image: nil
        }
      }
      cat = Cat.last
      patch "/cats/#{cat.id}", params: cat_params
      expect(response.status).to eq(422)
      json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end
  end
  
  describe 'DELETE /destroy' do
    it 'can delete a cat' do
      Cat.create(
        name: 'Max',
        age: 7,
        enjoys: 'Sleeps all day',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      cat = Cat.last
      delete "/cats/#{cat.id}"
      expect(response).to have_http_status(200)
      expect(Cat.all).to be_empty
    end
  end
end
