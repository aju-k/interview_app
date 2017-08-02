class LinksController < ApplicationController

  # home page
  def index
    @most_visited_url  = Link.get_popular_urls(params[:page])
  end

  # Get shortest link
  def get_shortest_link
    if params[:link].present?
      original_link = Link.add_url_protocol(params[:link])
      @link = Link.find_by_original_link(original_link)
      if @link.nil?
        @link = Link.create(original_link: original_link)
        unique_code = UniqueCodeMethods.generate_unique_code(@link.id)
        @link.update_attributes(unique_code: unique_code)
      end
      @shortest_link = request.base_url + '/' + @link.unique_code
    end
  end

  # Redirect to original link
  def redirect_to_original_link
    if params[:unique_code].present?
      id = UniqueCodeMethods.decode_unique_code(params[:unique_code])
      link = Link.find_record(id)
      if link.present?
        link.increase_visit_count
        redirect_to link.original_link
      end
    else
      render nothing: true
    end
  end

end
