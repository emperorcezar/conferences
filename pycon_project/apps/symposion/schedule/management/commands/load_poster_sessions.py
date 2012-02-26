from datetime import datetime

from django.core.management.base import BaseCommand

from symposion.schedule.models import Track, Session, Slot, Presentation
from symposion.conference.models import PresentationKind
class Command(BaseCommand):
    """
    This is a temporary command to generate the time slots for poster "presentations".
    """
    def handle(self, *args, **options):
        # Five minutes
        five = datetime.timedelta(0,0,0,0,5)

        # Going to create this as a list so I can delete from it easily
        posters = [p for p in Presentation.objects.filter(kind__slug="posters", cancelled=False)]
        
        # We're going to assume the tracks exist
        for track in ["Track I", "Track II", "Track III", "Track IV"]:
            track = Track.objects.get(title=track)
            # Five minute slots
            start = datetime(2012, 3, 11, 10, 30)

            for i in range(1, 90/5):
                slot = Slot.objects.create(
                    track = track,
                    start = start,
                    end = start + five,
                    )

                start = start + five

                presentation = presentations.pop()
                presentation.slot = slot
                presenation.save()
