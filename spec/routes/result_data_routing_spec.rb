# frozen_string_literal: true

RSpec.describe 'ResultData routing', type: :routing do
  it 'routes POST /result_data to result_data#create' do
    expect(post: '/result_data').to route_to('result_data#create')
  end

  it 'does not route GET /result_data' do
    expect(get: '/result_data').not_to be_routable
  end

  it 'does not route PUT /result_data' do
    expect(put: '/result_data').not_to be_routable
  end

  it 'does not route PATCH /result_data' do
    expect(patch: '/result_data').not_to be_routable
  end

  it 'does not route DELETE /result_data' do
    expect(delete: '/result_data').not_to be_routable
  end
end
