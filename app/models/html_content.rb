class HtmlContent
  include Mongoid::Document
  require 'open-uri'
  require 'nokogiri'
  
  field :link, type: String
  field :content, type: String

  validate :validate_url
  after_validation :parse_html

  private

  def validate_url
  	uri = URI.parse(self.link)
    !uri.host.nil?
  rescue URI::InvalidURIError
    errors.add(:link, 'Invalid format!')
  end

  def parse_html
  	html = Nokogiri::HTML(open(self.link))
  	h1 = html.css('h1')
  	h2 = html.css('h2')
  	h3 = html.css('h3')
  	a = html.css('a')
  	[h1,h2,h3,a].each {|nodeset| set_content(nodeset)}
  rescue
    errors.add(:link, 'Invalid link!')
  end

  def set_content(nodeset)
  	nodeset.each do |node|
  		self.content ||= ''
  		self.content = self.content << '  (#{node.name}) #{node.content}'
  		
  		#IF WE need to see the content without seperations and description of node name instead then:
  		# self.content = self.content << node.content
  		
  		#could also create seperate fields for each node or embedded docs even, if it is required to show them seperately
  	end
  end
end
