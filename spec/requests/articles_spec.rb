require 'rails_helper'

RSpec.describe ArticlesController do
  describe '#index' do

    let!(:article) { create :article }
    let(:body_response) do
      {
        data: [
          id: article.id.to_s,
          type: 'article',
          attributes: {
            title: article.title,
            content: article.content,
            slug: article.slug
          }
        ]
      }
    end

    it 'returns a success response' do
      get '/articles'
      expect(response).to have_http_status(:ok)
    end

    it 'returns a proper json' do
      get '/articles'
      body = JSON.parse(response.body).deep_symbolize_keys

      expect(body).to eq(body_response)
    end
  end
end