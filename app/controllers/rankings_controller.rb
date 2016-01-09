class RankingsController < ApplicationController
    
  def want
     # ids = Want.group(:item_id).order('count_item_id DESC').limit(10).count('item_id').keys
     # @want_ranking_items = Item.find(ids).sort_by{|i| ids.index(i.id)}
    @item_counts = Want.group(:item_id).order('count_id desc').limit(10).count(:id) 
    # @items = to_items(@item_counts)
    keys_to_item!(@item_counts)
  end

  def have
#ids = Have.group(:item_id).order('count_item_id DESC').limit(10).count('item_id').keys
# @have_ranking_items = Item.find(ids).sort_by{|i| ids.index(i.id)}
    @item_counts = Have.group(:item_id).order('count_id desc').limit(10).count(:id)
    keys_to_item!(@item_counts)
  end
  
  private 
    def keys_to_item!(hash) 
      hash.transform_keys!{ |key| Item.find(key) }
    end
    #def to_items(count)
     # count.transform_keys {|k| Item.find_by(k) } # 複数ユーザーの同時操作を考慮
    #end
end