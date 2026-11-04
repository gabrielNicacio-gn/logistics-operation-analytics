from dataclasses import dataclass, field
from datetime import datetime
from uuid import UUID, uuid4


@dataclass
class Snapshot:
    id: UUID = field(default_factory=uuid4)
    day_operation_id: UUID | None = None
    captured_at: datetime = field(default_factory=datetime.now)
    is_first_registry: bool = False
