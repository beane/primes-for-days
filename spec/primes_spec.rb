require 'prime'

describe 'prime finder' do
  it 'won\'t break when asked to find no primes' do
    expect(get_n_primes(0)).to eq([])
  end

  it 'finds the first 10 primes' do
    expect(get_n_primes(10)).to eq(Prime.first(10))
  end

  it 'finds an arbitrary number of primes' do
    n = rand(10000)
    expect(get_n_primes(n)).to eq(Prime.first(n))
  end
end

