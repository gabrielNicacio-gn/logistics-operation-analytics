from dataclasses import dataclass, field
from datetime import date
from uuid import UUID, uuid4


@dataclass
class DayOperation:
    id: UUID = field(default_factory=uuid4)
    operation_date: date = field(default_factory=date.today)
