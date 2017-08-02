class Link < ActiveRecord::Base

  # Get a record
  def self.find_record(id)
    where(id: id).first
  end

  # Increase visit count
  def increase_visit_count
    self.visit_count += 1
    update_attributes(visit_count: visit_count)
  end

  # Get most visited urls
  def self.get_popular_urls(page_no = 0)
    links = Link.order('visit_count DESC').limit(100)
    links.paginate(:page => page_no, per_page: 10, total_entries: links.count)
  end

  # Add url protocol to string
  def self.add_url_protocol(original_link)
    unless original_link[/\Ahttp:\/\//] || original_link[/\Ahttps:\/\//]
      return "http://#{original_link}"
    else
      return original_link
    end
  end


end
