# README
COSC480 Colgate Jitney Group 1
Liam McGovern, Jack Kerning, Ryan Wetsman, Peyton Baker, Harrison Chen



What models do we need?

Driver
  Attributes:
    Name (First and Last?)
    Car Make
    Car Model
    License Plate Number
    Picture of Car? (Doesn't have right now)
    Number of Availabe seats
    Whether they are Currently Accepting Riders
    Location (Doesn't have right now)
    
Rider
  Attributes:
    Name (First and Last?)
    Size of Group? (Doesn't have right now)
    Available Credit? (Doesn't have right now)
    Intial location (Doesn't have right now)
    Destination

Review
  Attributes:
    Number of Stars
    Description
    Reviwer (Comes from Rider)
    
Relationships: (Maybe wrong)
  Driver has_many :reviews
         has_many :riders, :through => :reviews
  Rdier has_many :reviews
        has_many :drivers, ;through => :reviews
  Review belongs_to :drivers
         belongs_to :riders
