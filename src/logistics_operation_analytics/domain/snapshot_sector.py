from dataclasses import dataclass, field
from uuid import UUID, uuid4


@dataclass
class SnapshotSector:
    id: UUID = field(default_factory=uuid4)
    snapshot_id: UUID | None = None
    sector: str = ""
    total_pickings: int = 0
    pending_pickings: int = 0
    new_pickings: int = 0
