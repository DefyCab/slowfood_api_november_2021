# Three steps of testing

# Arrange
# Act
# Assert

RSpec.describe 'PUT /api/orders/:id', type: :request do
  subject { response }
  let(:product_1) { create(:product, name: 'Pizza') }
  let(:product_2) { create(:product, name: 'Kebab') }
  let(:order) { create(:order) }
  let!(:order_item_1) { create(:order_item, order: order, product: product_1) }

  before do
    put "/api/orders/#{order.id}", params: { product_id: product_2.id }

    @order = Order.last
  end

  it { is_expected.to have_http_status :ok }

  it 'is expected to respond with a message' do
    response_body = JSON.parse(response.body)
    expect(response_body['message']).to eq 'Kebab was added to your order'
  end
    it 'is expected to hold two items' do
      expect(@order.items.count).to eq 2
    end
  end

  # it 'does something' do
  #   binding.pry
  # end

