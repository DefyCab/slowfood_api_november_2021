RSpec.describe Order, type: :model do
  describe 'Database Table' do
    it {
      is_expected.to have_db_column(:id)
        .of_type(:integer)
    }
    it {
      is_expected.to have_db_column(:user_id)
        .of_type(:integer)
    }
  end
  describe 'Associations' do
    it {
      is_expected.to belong_to(:user)
    }
    it {
      is_expected.to have_many(:items)
        .class_name('OrderItem')
    }
  end
  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:order)).to be_valid
    end
  end
  describe '' do
    describe '#serialization' do
      let(:product_1) { create(:product, name: 'Pizza') }
      let(:product_2) { create(:product, name: 'Kebab') }
      let(:order) { create(:order) }
      let!(:order_item_1) { create(:order_item, order: order, product: product_1) }
      let!(:order_item_2) { create(:order_item, order: order, product: product_2) }

      it { is_expected.to respond_to :serialized }

      it 'is expected to return json object :items' do
        expect(order.serialized[:products].size).to eq 2
      end
    end
  end
end
