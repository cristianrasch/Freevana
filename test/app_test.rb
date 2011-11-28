require File.expand_path('helper', File.dirname(__FILE__))

scope do
  test '/' do
    visit '/'
    assert has_content?('Freevana')
  end
  
  test '/index with a blank url' do |params|
    visit '/index?url'
    assert has_content?('You need to provide a URL!')
  end
  
  setup do
    {url: '..'}
  end
  test '/index with an invalid url' do |params|
    visit "/index?url=#{params[:url]}"
    assert has_content?('You need to provide a valid URL!')
  end
  
  setup do
    {url: 'http://www.cuevana.tv/peliculas/4272/carjacked'}
  end
  test '/index with a valid cuevana url' do |params|
    visit "/index?url=#{params[:url]}"
    assert has_content?('http://www.wupload.com/file/2598160942/?id=4272')
  end
  
  setup do
    {url: 'http://www.peliplay.com/cat-run/'}
  end
  test '/index with a valid peliplay url' do |params|
    visit "/index?url=#{params[:url]}"
    assert has_content?('http://www.megaupload.com/?d=BH0KI5Y2&id=2911')
  end
end
