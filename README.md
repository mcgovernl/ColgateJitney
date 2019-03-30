# README
COSC480 Colgate Jitney Group 1
Liam McGovern, Jack Kerning, Ryan Wetsman, Peyton Baker, Harrison Chen

What models do we need?

Driver
  Attributes:
    Name (First and Last?)
    Car Make
    Car Model
    License Plate Number?
    Picture of Car?
    Number of Availabe seats
    Whether they are Currently Accepting Riders
    
Rider
  Attributes:
    Name (First and Last?)
    Size of Group?
    Available Credit?
    Intial location
    Destination

Review
  Attributes:
    Number of Stars
    Reviwer (Comes from Rider)
    
Relationships: (Maybe wrong)
  Driver has_many :reviews
         has_many :riders, :through => :reviews
  Rdier has_many :reviews
        has_many :drivers, ;through => :reviews
  Review belongs_to :drivers
         belongs_to :riders
