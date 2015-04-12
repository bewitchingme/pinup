class EventType < ActiveRecord::Base
  before_save :to_lower_case

  has_many :events

  def to_s
    "#{ name.titleize unless name.nil? }"
  end

  def icon
    return 'icons/misc.png' if name.nil?
    case name
    when 'dance'; 'icons/dance.png'
    when 'theatre'; 'icons/theatre.png'
    when 'spoken word / literature'; 'icons/swl.png'
    when 'visual arts'; 'icons/visual_arts.png'
    when 'classical'; 'icons/classical.png'
    when 'pop'; 'icons/pop.png'
    when 'rock'; 'icons/rock.png'
    when 'punk'; 'icons/punk.png'
    when 'hip hop'; 'icons/hip_hop.png'
    when 'r&b'; 'icons/rnb.png'
    when 'reggae'; 'icons/reggae.png'
    when 'blues'; 'icons/blues.png'
    when 'jazz'; 'icons/jazz.png'
    when 'electronic music'; 'icons/electronic_music.png'
    when 'alternative'; 'icons/alternative.png'
    when 'experimental'; 'icons/experimental.png'
    when 'world'; 'icons/world.png'
    when 'mixed media'; 'icons/mixed_media.png'
    
    else
      'icons/misc.png'
    end
  end

  private
    def to_lower_case
      self.name = name.downcase unless name.nil?
    end
end
