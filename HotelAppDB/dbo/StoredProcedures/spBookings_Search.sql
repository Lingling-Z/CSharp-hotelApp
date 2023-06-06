CREATE PROCEDURE [dbo].[spBookings_Search]
	@lastName nvarchar(50),
	@startDate date
AS
begin
	set nocount on;

	select [b].[Id], [b].[RoomId], [b].[GuestId], [b].[StartDate], [b].[EndDate], [b].[CheckedIn], [b].[TotalPrice],
			[g].[Id], [g].[FirstName], [g].[LastName],
			[r].[RoomNumber], [r].[RoomTypeId],
			[t].[Title], [t].[Description], [t].[Price]
	from dbo.Bookings b
	inner join dbo.Guests g on g.Id = b.GuestId
	inner join dbo.Rooms r on r.Id = b.RoomId
	inner join dbo.RoomTypes t on t.Id = r.RoomTypeId
	where @startDate = b.StartDate and g.LastName = @lastName 
end
